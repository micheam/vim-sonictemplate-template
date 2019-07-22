{:paths ["src"]
 :deps {org.clojure/clojure {:mvn/version "1.10.0"}
        {{_cursor_}}}
 :aliases {
           :uberjar {:extra-deps
                     {luchiniatwork/cambada {:mvn/version "1.0.0"}}
                     :main-opts ["-m" "cambada.uberjar"
                                 "-m" "{{_input_:entiry-ns}}"]}
           :native-image {:main-opts ["-m clj.native-image {{_input_:entiry-ns}}"
                                      "--initialize-at-build-time"
                                      ;; optional native image name override
                                      "-H:Name={{_input_:binary-name}}"]
                          :jvm-opts ["-Dclojure.compiler.direct-linking=true"]
                          :extra-deps {clj.native-image 
                                       {:git/url "https://github.com/taylorwood/clj.native-image.git"
                                        :sha "7708e7fd4572459c81f6a6b8e44c96f41cdd92d4"}}}}}
