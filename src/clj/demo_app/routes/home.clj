(ns demo-app.routes.home
  (:require
   [demo-app.layout :as layout]
   [demo-app.db.core :as db]
   [clojure.java.io :as io]
   [demo-app.middleware :as middleware]
   [ring.util.response]
   [ring.util.http-response :as response]))

(defn home-page [{:keys [flash] :as request}]
 (layout/render
  request
  "home.html"
  (merge {:users (db/get-users)}
         (select-keys flash [:name :user :errors]))))

(defn home-routes []
  [""
   {:middleware [middleware/wrap-csrf
                 middleware/wrap-formats]}
   ["/" {:get home-page}]
   ["/docs" {:get (fn [_]
                    (-> (response/ok (-> "docs/docs.md" io/resource slurp))
                        (response/header "Content-Type" "text/plain; charset=utf-8")))}]])

