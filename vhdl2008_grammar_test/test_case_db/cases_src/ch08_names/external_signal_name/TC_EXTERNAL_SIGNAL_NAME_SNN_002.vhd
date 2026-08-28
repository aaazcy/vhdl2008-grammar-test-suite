-- =============================================================
-- Case ID: TC_EXTERNAL_SIGNAL_NAME_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_SIGNAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_signal_name ::= << signal external_pathname : subtype_indication >>
-- Case Type: Negative
-- Test Focus: Missing 'signal' keyword — external_signal_name requires 'signal' keyword after <<; omitting it violates the BNF production
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ext_sig_snn2_ent is port(r:out bit); end entity;
architecture bh of ext_sig_snn2_ent is
  -- ERROR: missing 'signal' keyword after <<
  alias bad_sig is << .tb_top.uut.clk : bit >>;
begin
  r <= '0';
end architecture bh;
