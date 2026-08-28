-- =============================================================
-- Case ID: TC_IDENTIFIER_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: identifier ::= basic_identifier | extended_identifier
-- Case Type: Positive
-- Test Focus: Entity and signals using only extended_identifier — testing identifier derivation via the extended_identifier branch, special characters legal inside backslashes
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity \id_ext_only\ is
  port (
    \bus_in\  : in  integer;
    \sum_out\ : out integer
  );
end entity \id_ext_only\;

architecture rtl of \id_ext_only\ is
  signal \reg_val\ : integer := 0;
begin
  \reg_val\ <= \bus_in\ + 10;
  \sum_out\ <= \reg_val\;
end architecture rtl;
