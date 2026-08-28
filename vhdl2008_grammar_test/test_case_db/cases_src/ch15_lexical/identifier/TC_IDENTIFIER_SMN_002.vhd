-- =============================================================
-- Case ID: TC_IDENTIFIER_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: identifier ::= basic_identifier | extended_identifier
-- Case Type: Negative
-- Test Focus: SMN: Reference to an undeclared identifier — in y <= no_such_id, no_such_id has no declaration, the identifier cannot be resolved at analysis time
-- Expected Result: Triggers analysis error: no declaration for "no_such_id"
-- Dependencies: None
-- =============================================================
entity id_undeclared is
  port (
    val_out : out integer
  );
end entity id_undeclared;

architecture vhdl2008 of id_undeclared is
begin
  val_out <= no_such_id;
end architecture vhdl2008;
