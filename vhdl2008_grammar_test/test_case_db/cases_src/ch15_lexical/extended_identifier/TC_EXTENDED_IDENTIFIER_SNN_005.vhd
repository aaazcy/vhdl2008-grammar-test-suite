-- =============================================================
-- Case ID: TC_EXTENDED_IDENTIFIER_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTENDED_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: extended_identifier ::= \ graphic_character { graphic_character } \
-- Case Type: Negative
-- Test Focus: Unescaped backslash embedded inside extended_identifier — inner graphic_character cannot contain \ itself, confusing the identifier boundary
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity ext_id_snn_005 is
  port (
    \bad\sig\ : out integer
  );
end entity ext_id_snn_005;

architecture rtl of ext_id_snn_005 is
begin
  \bad\sig\ <= 0;
end architecture rtl;
