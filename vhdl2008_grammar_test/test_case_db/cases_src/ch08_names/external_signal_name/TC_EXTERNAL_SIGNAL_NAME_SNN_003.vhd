-- =============================================================
-- Case ID: TC_EXTERNAL_SIGNAL_NAME_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_SIGNAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_signal_name ::= << signal external_pathname : subtype_indication >>
-- Case Type: Negative
-- Test Focus: Missing subtype_indication — external_signal_name requires ': subtype_indication' after the pathname; omitting the colon and type violates the BNF
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ext_sig_snn3_ent is port(r:out bit); end entity;
architecture bh of ext_sig_snn3_ent is
  -- ERROR: missing ': subtype_indication'
  alias bad_sig is <<signal .tb_top.uut.clk>>;
begin
  r <= '0';
end architecture bh;
