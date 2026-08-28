-- =============================================================
-- Case ID: TC_IDENTIFIER_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4
-- Production: identifier ::= basic_identifier | extended_identifier
-- Case Type: Positive
-- Test Focus: Two forms of identifier: basic identifier (letter start + letters, digits, underscores, case insensitive) / extended identifier (backslash escaped, case sensitive, may contain spaces and special characters), verifying both identifier forms are usable in entity names, signal names and port names
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity \id_test\ is
  port(\data_in\:in integer; \data_out\:out integer);
end entity;
architecture bh of \id_test\ is
  signal basic_sig:integer:=0;
  signal \ext_sig_with_spaces\:integer:=42;
  constant C_BASIC:integer:=100;
begin
  basic_sig<=\data_in\+C_BASIC;
  \data_out\<=basic_sig+\ext_sig_with_spaces\;
end architecture bh;
