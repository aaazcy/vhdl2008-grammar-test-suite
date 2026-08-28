-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_ITEM_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Positive
-- Test Focus: subprogram_declarative_item: subtype_declaration and type_declaration inside a procedure — exercises multiple subprogram_declarative_item alternatives within a procedure's declarative region
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sdi_type_subtype is
  port (
    start_flag : in  bit;
    idx_out    : out natural;
    range_out  : out natural
  );
end entity;

architecture test of sdi_type_subtype is
  procedure p_range_calc(signal flag : in bit; signal idx, rng : out natural) is
    -- type_declaration (subprogram_declarative_item)
    type index_t is range 0 to 63;
    -- subtype_declaration (subprogram_declarative_item)
    subtype active_t is index_t range 4 to 60;
    -- constant_declaration (subprogram_declarative_item)
    constant C_START : active_t := 4;
    -- variable_declaration (subprogram_declarative_item)
    variable v_idx : active_t := C_START;
  begin
    if flag = '1' then
      v_idx := v_idx + 1;
      if v_idx > 60 then v_idx := C_START; end if;
    end if;
    idx <= natural(v_idx);
    rng <= 60 - 4;
  end procedure;

  signal s_idx : natural := 0;
  signal s_rng : natural := 0;
begin
  p_range_calc(start_flag, s_idx, s_rng);
  idx_out   <= s_idx;
  range_out <= s_rng;
end architecture test;
