-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_ITEM_SYN_005
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
-- Test Focus: Body declarative item — attribute_declaration
--   and attribute_specification. Attributes are applied to
--   body-side variables and methods for documentation/synthesis.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_body_di_attr is
  port (
    clk    : in  bit;
    status : out integer
  );
end entity pt_body_di_attr;

architecture rtl of pt_body_di_attr is
  type t_mem is protected
    procedure write(addr : natural; d : integer);
    impure function read(addr : natural) return integer;
  end protected;
  type t_mem is protected body
    type t_ram is array(0 to 63) of integer;
    attribute keep : string;
    variable v_ram : t_ram := (others => 0);
    attribute keep of v_ram : variable is "true";
    procedure write(addr : natural; d : integer) is
    begin
      v_ram(addr mod 64) := d;
    end procedure;
    impure function read(addr : natural) return integer is
    begin
      return v_ram(addr mod 64);
    end function;
  end protected body;
  shared variable sv : t_mem;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.write(0, 42);
      sv.write(1, 17);
      status <= sv.read(0) + sv.read(1);
    end if;
  end process;
end architecture rtl;
