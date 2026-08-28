-- =============================================================
-- Case ID: TC_GUARDED_SIGNAL_SPECIFICATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_GUARDED_SIGNAL_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: guarded_signal_specification ::= guarded_signal_list : type_mark
-- Case Type: Negative
-- Test Focus: Missing colon before type_mark — guarded_signal_specification requires ':' between the signal list and type_mark; omitting it violates the BNF
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity gss_snn2_ent is port(r:out bit); end entity;
architecture bh of gss_snn2_ent is
  signal s : bit bus := '0';
  -- ERROR: missing colon before type_mark
  disconnect s bit after 1 ns;
begin
  s <= '1'; r <= s;
end architecture bh;
