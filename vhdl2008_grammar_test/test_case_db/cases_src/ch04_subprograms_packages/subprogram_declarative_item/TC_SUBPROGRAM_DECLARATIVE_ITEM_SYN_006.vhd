-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_ITEM_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Positive
-- Test Focus: subprogram_declarative_item: variable_declaration and constant_declaration inside a function body — exercises these alternatives as they appear within the declarative part of a subprogram body
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sdi_var_const is
  port (
    dividend : in  integer;
    divisor  : in  integer;
    quotient : out integer;
    remainder: out integer
  );
end entity;

architecture test of sdi_var_const is
  function f_divide(a, b : integer) return integer is
    -- constant_declaration (subprogram_declarative_item)
    constant C_ZERO : integer := 0;
    -- variable_declaration (subprogram_declarative_item)
    variable v_q : integer := 0;
    variable v_r : integer := a;
  begin
    if b = C_ZERO then
      return C_ZERO;
    end if;
    while v_r >= b loop
      v_r := v_r - b;
      v_q := v_q + 1;
    end loop;
    return v_q;
  end function;

  function f_modulo(a, b : integer) return integer is
    constant C_ZERO : integer := 0;
    variable v_r : integer := a;
  begin
    if b = C_ZERO then return C_ZERO; end if;
    while v_r >= b loop v_r := v_r - b; end loop;
    return v_r;
  end function;
begin
  quotient  <= f_divide(dividend, divisor);
  remainder <= f_modulo(dividend, divisor);
end architecture test;
