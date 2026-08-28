-- =============================================================
-- Case ID: TC_PROCESS_DECLARATIVE_ITEM_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Positive
-- Test Focus: subprogram_body declaration——the process declarative part defines a function, verifying that a function/procedure body can serve as a process declarative item
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pdi_func_ent is
  port(clk : in bit; a, b : in integer; y : out integer);
end entity pdi_func_ent;
architecture bh of pdi_func_ent is
begin
  process(clk) is
    function f_max(x, y : integer) return integer is
    begin
      if x > y then return x; else return y; end if;
    end function f_max;
    variable v_max : integer;
  begin
    if clk'event and clk = '1' then
      v_max := f_max(a, b);
      y <= v_max;
    end if;
  end process;
end architecture bh;
