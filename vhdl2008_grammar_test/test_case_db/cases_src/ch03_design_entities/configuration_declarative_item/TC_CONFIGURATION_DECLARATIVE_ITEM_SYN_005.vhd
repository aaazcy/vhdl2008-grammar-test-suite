-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_ITEM_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_item ::= use_clause | attribute_specification | group_declaration
-- Case Type: Positive
-- Test Focus: All three configuration_declarative_item kinds mixed: use_clause + attribute_specification + group_declaration coexist in the same configuration declarative part, verifying the three declarative items can be combined in any order
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cdi_mix_ent is
  port(a,b:in bit; y_and,y_or:out bit);
  signal s1,s2:bit;
  group logic_pair is (signal, signal);
  attribute area_est : integer;
end entity;
architecture rtl of cdi_mix_ent is
begin
  s1<=a and b; s2<=a or b;
  y_and<=s1; y_or<=s2;
end architecture;
configuration cdi_mix_cfg of cdi_mix_ent is
  use std.standard.all;
  group lg_grp : logic_pair (s1, s2);
  attribute area_est of all : architecture is 42;
  for rtl end for;
end configuration cdi_mix_cfg;
