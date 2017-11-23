resource "google_compute_firewall" "bitcoin" {
  name    = "bitcoind"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["8333"]
  }
  source_ranges = ["0.0.0.0/0"]
}
