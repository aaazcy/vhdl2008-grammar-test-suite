-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_ITEM_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_item ::= use_clause | attribute_specification | group_declaration
-- Case Type: Positive
-- Test Focus: configuration_declarative_item (group_declaration): the configuration declarative part first declares a group_template_declaration, then groups signals in the architecture through a group_declaration, verifying the syntactic correctness of group declarations as configuration declarative items
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cdi_group_ent is
  port(a,b,sel:in bit; y:out bit);
  signal s_and,s_or:bit;
  group data_path is (signal, signal);
  group ctrl_path is (signal);
end entity;
architecture rtl of cdi_group_ent is
  signal s_out:bit;
begin
  s_and<=a and b; s_or<=a or b;
  s_out<=s_and when sel='0' else s_or;
  y<=s_out;
end architecture;
configuration cdi_group_cfg of cdi_group_ent is
  group dp_grp : data_path (s_and, s_or);
  group cp_grp : ctrl_path (sel);
  for rtl end for;
end configuration cdi_group_cfg;
