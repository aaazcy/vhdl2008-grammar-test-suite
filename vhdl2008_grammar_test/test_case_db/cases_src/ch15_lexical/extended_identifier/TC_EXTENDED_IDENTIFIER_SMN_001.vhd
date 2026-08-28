-- =============================================================
-- Case ID: TC_EXTENDED_IDENTIFIER_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_EXTENDED_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: extended_identifier ::= \ graphic_character { graphic_character } \
-- Case Type: Negative
-- Test Focus: extended_identifier used as entity name but conflicts with an internal basic_identifier port name — entity \foo\ and port foo overlap in namespace
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity ext_id_smn_001 is
  port (
    \entity\ : out bit
  );
end entity ext_id_smn_001;

architecture rtl of ext_id_smn_001 is
  signal \entity\ : bit := '0';
begin
  \entity\ <= '1';
end architecture rtl;
