-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_ITEM_SYN_004
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declarative_item ::=
--   subprogram_declaration |
--   subprogram_instantiation_declaration |
--   attribute_specification |
--   use_clause
-- Test Focus: Declarative item — impure function declaration
--   with complex return type (array). Tests that function
--   declarations with array return types are valid subprogram
--   declarations in the protected type declarative part.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_decl_di_array_ret is
  port (
    latch  : in  bit;
    output : out bit_vector(3 downto 0)
  );
end entity pt_decl_di_array_ret;

architecture rtl of pt_decl_di_array_ret is
  subtype t_nibble is bit_vector(3 downto 0);
  type t_framer is protected
    procedure write(d : bit_vector(3 downto 0));
    impure function frame return t_nibble;
  end protected;
  type t_framer is protected body
    variable v_buf : bit_vector(3 downto 0) := "0000";
    procedure write(d : bit_vector(3 downto 0)) is begin v_buf := d; end procedure;
    impure function frame return t_nibble is begin return v_buf; end function;
  end protected body;
  shared variable sv : t_framer;
begin
  process(latch)
  begin
    if latch'event and latch = '1' then
      sv.write("1101");
      output <= sv.frame;
    end if;
  end process;
end architecture rtl;
