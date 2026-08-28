-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_PART_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_part ::= { configuration_declarative_item }
-- Case Type: Positive
-- Test Focus: configuration_declarative_part with five mixed declarative items: multiple use_clauses + multiple attribute_specifications + a group_declaration appear interleaved, verifying the declarative part can hold a larger set of multi-kind declarative items
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cdp_many_ent is
  port(a,b,cin:in bit; sum,cout:out bit);
  signal s_xor,s_and1,s_and2:bit;
  attribute fanout : integer;
  attribute delay_est : integer;
  group logic_chain is (signal, signal);
end entity;
architecture rtl of cdp_many_ent is
begin
  s_xor<=a xor b; sum<=s_xor xor cin;
  s_and1<=a and b; s_and2<=s_xor and cin;
  cout<=s_and1 or s_and2;
end architecture;
configuration cdp_many_cfg of cdp_many_ent is
  use std.standard.all;
  attribute fanout of all : architecture is 4;
  group adder_path : logic_chain (s_xor, s_and1);
  attribute delay_est of all : architecture is 3;
  for rtl end for;
end configuration cdp_many_cfg;
