-- =============================================================
-- Case ID: TC_GUARDED_SIGNAL_SPECIFICATION_SNN_004
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_GUARDED_SIGNAL_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: guarded_signal_specification ::= guarded_signal_list : type_mark
-- Case Type: Negative
-- Test Focus: Missing type_mark after colon -- the guarded_signal_specification requires a valid type_mark after the colon; placing a time expression directly after the colon without a type_mark violates the grammar
-- Expected Result: Triggers syntax error (type_mark expected before time expression)
-- Dependencies: None
-- =============================================================
entity gss_snn4_no_type is
  port(r : out bit bus);
end entity;

architecture bh of gss_snn4_no_type is
  signal s : bit bus := '0';
  -- ERROR: missing type_mark; "after 1 ns" is not a type_mark
  disconnect s : after 1 ns;
begin
  s <= '1';
  r <= s;
end architecture bh;
