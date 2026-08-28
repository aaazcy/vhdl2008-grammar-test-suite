-- =============================================================
-- Case ID: TC_EXTENDED_IDENTIFIER_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_EXTENDED_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: extended_identifier ::= \ graphic_character { graphic_character } \
-- Case Type: Negative
-- Test Focus: SMN: Type mismatch in signal assignment via extended_identifier — in \my_sig\ <= true, true is boolean type, mismatching integer type signal \my_sig\
-- Expected Result: Triggers analysis error: can't match "true" with type integer
-- Dependencies: None
-- =============================================================
entity ext_id_type_mismatch is
  port (
    val_out : out integer
  );
end entity ext_id_type_mismatch;

architecture vhdl2008 of ext_id_type_mismatch is
  signal \my_sig\ : integer := 0;
begin
  \my_sig\ <= true;
  val_out <= \my_sig\;
end architecture vhdl2008;
