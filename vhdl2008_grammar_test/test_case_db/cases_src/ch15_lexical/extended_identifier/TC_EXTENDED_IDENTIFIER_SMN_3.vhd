-- =============================================================
-- Case ID: TC_EXTENDED_IDENTIFIER_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: BNF_EXTENDED_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: extended_identifier ::= \ graphic_character { graphic_character } \
-- Case Type: Negative
-- Test Focus: extended_identifier referencing an undeclared signal — \unconnected\ is not declared in the architecture, referencing an undefined identifier
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity ext_id_sem_002 is
  port (
    val_out : out integer
  );
end entity ext_id_sem_002;

architecture rtl of ext_id_sem_002 is
  signal data : integer := 5;
begin
  val_out <= \unconnected\;
end architecture rtl;
