function Amp_out = amp_k_alpha(alpha, K, Amp_in)

Amp_out = alpha * Amp_in;

id = find( abs(Amp_out) > K);
Amp_out(id) = sign(Amp_out(id)) * K;

