-- =============================================================
-- Case ID: TC_EXTENDED_IDENTIFIER_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTENDED_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: extended_identifier ::= \ graphic_character { graphic_character } \
-- Case Type: Negative
-- Test Focus: extended_identifier missing the closing backslash — it must begin and end with \, the missing closing \ causes a lexical error
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity ext_id_snn_001 is
  port (
    \bad_signal : out integer
  );
end entity ext_id_snn_001;

architecture rtl of ext_id_snn_001 is
begin
  \bad_signal <= 0;
end architecture rtl;
