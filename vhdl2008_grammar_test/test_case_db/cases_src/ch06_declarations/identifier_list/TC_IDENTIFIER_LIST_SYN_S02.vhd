-- =============================================================
-- Case ID: TC_IDENTIFIER_LIST_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_IDENTIFIER_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.2
-- Production: identifier_list ::= identifier { , identifier }
-- Case Type: Positive
-- Test Focus: Production-specific: exercises identifier_list with a long comma-separated list of port identifiers.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity identifier_list_syn_s2 is
  port (
    a0, a1, a2, a3 : in  bit;
    b0, b1, b2, b3 : in  bit;
    s0, s1, s2, s3 : out bit
  );
end entity identifier_list_syn_s2;

architecture rtl of identifier_list_syn_s2 is
  signal x0, x1, x2, x3 : bit;
begin
  x0 <= a0 xor b0;
  x1 <= a1 xor b1;
  x2 <= a2 xor b2;
  x3 <= a3 xor b3;
  s0 <= x0; s1 <= x1; s2 <= x2; s3 <= x3;
end architecture rtl;
