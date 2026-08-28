-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_PART_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_part ::= { configuration_declarative_item }
-- Case Type: Positive
-- Test Focus: configuration_declarative_part with three declarative items (use+attr+group): three different declaration categories each appear once, verifying diversified combination and order flexibility of the declarative part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cdp_three_ent is
  port(a,b:in bit; y_and,y_xor:out bit);
  signal s1,s2:bit;
  group sig_pair is (signal, signal);
  attribute opt_level : integer;
end entity;
architecture rtl of cdp_three_ent is
begin
  s1<=a and b; s2<=a xor b;
  y_and<=s1; y_xor<=s2;
end architecture;
configuration cdp_three_cfg of cdp_three_ent is
  use std.standard.all;
  group dp : sig_pair (s1, s2);
  attribute opt_level of all : architecture is 3;
  for rtl end for;
end configuration cdp_three_cfg;
