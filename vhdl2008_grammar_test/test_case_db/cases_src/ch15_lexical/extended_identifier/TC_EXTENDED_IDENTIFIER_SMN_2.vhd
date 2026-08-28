-- =============================================================
-- Case ID: TC_EXTENDED_IDENTIFIER_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_EXTENDED_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: extended_identifier ::= \ graphic_character { graphic_character } \
-- Case Type: Negative
-- Test Focus: SEM: Reference to an undeclared extended_identifier — in y <= \no_such_sig\, \no_such_sig\ has no declaration, the extended identifier cannot be resolved at analysis time
-- Expected Result: Triggers analysis error: no declaration for "\no_such_sig\"
-- Dependencies: None
-- =============================================================
entity ext_id_undeclared is
  port (
    val_out : out integer
  );
end entity ext_id_undeclared;

architecture vhdl2008 of ext_id_undeclared is
begin
  val_out <= \no_such_sig\;
end architecture vhdl2008;
