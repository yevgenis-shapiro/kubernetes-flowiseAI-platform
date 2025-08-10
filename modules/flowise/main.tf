
resource "helm_release" "flowise" {
  name       = "flowise"
  repository = "https://cowboysysop.github.io/charts/"
  chart      = "flowise"
  version    = "6.0.0" # optional, or latest available
  namespace  = "flowise-ai"
  create_namespace = true
  timeout = 300
  # Optional: override values from values.yaml
  
  set {
    name  = "image.tag"
    value = "3.0.3"
  }

  set {
    name  = "service.type"
    value = "ClusterIP"
  }
  # You could also do:
  # values = [file("${path.module}/values.yaml")]
}
