-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_ITEM_SYN_004
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body_declarative_item ::=
--   subprogram_declaration | subprogram_body |
--   subprogram_instantiation_declaration | package_declaration |
--   package_body | package_instantiation_declaration |
--   type_declaration | subtype_declaration |
--   constant_declaration | variable_declaration |
--   file_declaration | alias_declaration | attribute_declaration |
--   attribute_specification | use_clause |
--   group_template_declaration | group_declaration
-- Test Focus: Body declarative item — alias_declaration:
--   alias for a body-side variable, used to provide a shorter
--   name within method implementations.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_body_di_alias is
  port (
    clk : in  bit;
    out_val : out bit_vector(7 downto 0)
  );
end entity pt_body_di_alias;

architecture rtl of pt_body_di_alias is
  subtype t_byte is bit_vector(7 downto 0);
  type t_reg is protected
    procedure wr(d : bit_vector(7 downto 0));
    impure function rd return t_byte;
  end protected;
  type t_reg is protected body
    variable v_regfile : bit_vector(31 downto 0) := (others => '0');
    alias a_byte0 : bit_vector(7 downto 0) is v_regfile(7 downto 0);
    alias a_byte1 : bit_vector(7 downto 0) is v_regfile(15 downto 8);
    procedure wr(d : bit_vector(7 downto 0)) is
    begin
      a_byte0 := d;
      a_byte1 := a_byte0 xor "10101010";
    end procedure;
    impure function rd return t_byte is
    begin
      return a_byte1;
    end function;
  end protected body;
  shared variable sv : t_reg;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.wr("11001100");
      out_val <= sv.rd;
    end if;
  end process;
end architecture rtl;
