-- =============================================================
-- Case ID: TC_EXTENDED_IDENTIFIER_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTENDED_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: extended_identifier ::= \ graphic_character { graphic_character } \
-- Case Type: Positive
-- Test Focus: extended_identifier of simple letters used as signal name, backslash pairs enclose an identifier that may contain any graphic_character
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity ext_id_simple is
  port (
    \data_out\ : out integer
  );
end entity ext_id_simple;

architecture rtl of ext_id_simple is
  signal \my_signal\ : integer := 42;
begin
  \my_signal\ <= 100;
  \data_out\   <= \my_signal\;
end architecture rtl;
