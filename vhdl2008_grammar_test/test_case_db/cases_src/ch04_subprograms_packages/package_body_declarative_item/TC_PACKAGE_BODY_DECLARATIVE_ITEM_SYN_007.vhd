-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_ITEM_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Positive
-- Test Focus: package_body_declarative_item: constant, variable, and subtype declarations — exercises three distinct package_body_declarative_item alternatives (constant_declaration, variable_declaration, subtype_declaration) in one region
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pbdi_const_var_subtype is
  port (
    enabled  : in  bit;
    threshold: out natural;
    count    : buffer natural
  );
end entity;

architecture test of pbdi_const_var_subtype is
  -- constant_declaration (valid declarative item)
  constant C_THRESHOLD : natural := 128;
  -- subtype_declaration (valid declarative item)
  subtype byte_t is natural range 0 to 255;
  -- subprogram_body (valid declarative item)
  function f_clamp(v : natural; max_val : byte_t) return byte_t is
  begin
    if v > max_val then return max_val;
    else return v;
    end if;
  end function;

  signal s_cnt : natural := 0;
begin
  process(enabled) is
  begin
    if enabled = '1' then
      s_cnt <= s_cnt + 1;
    end if;
  end process;
  threshold <= C_THRESHOLD;
  count     <= f_clamp(s_cnt, 255);
end architecture test;
