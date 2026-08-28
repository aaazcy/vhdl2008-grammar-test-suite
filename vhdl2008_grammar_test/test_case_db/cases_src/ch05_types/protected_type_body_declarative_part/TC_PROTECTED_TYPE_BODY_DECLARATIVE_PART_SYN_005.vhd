-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_PART_SYN_005
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body_declarative_part ::=
--   { protected_type_body_declarative_item }
-- Test Focus: Attribute specification on body-side variable
--   along with constants and subprogram bodies. Tests that
--   attribute_specification is a valid body declarative item
--   interleaved with other items.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_body_dp_attr is
  port (
    strobe : in  bit;
    data   : out bit_vector(15 downto 0)
  );
end entity pt_body_dp_attr;

architecture rtl of pt_body_dp_attr is
  subtype t_word16 is bit_vector(15 downto 0);
  type t_shreg is protected
    procedure shift_in(b : bit);
    impure function parallel_out return t_word16;
  end protected;
  type t_shreg is protected body
    constant C_WIDTH : natural := 16;
    variable v_reg : bit_vector(C_WIDTH - 1 downto 0) := (others => '0');
    attribute keep : string;
    attribute keep of v_reg : variable is "true";
    procedure shift_in(b : bit) is
    begin
      v_reg := v_reg(14 downto 0) & b;
    end procedure;
    impure function parallel_out return t_word16 is
    begin
      return v_reg;
    end function;
  end protected body;
  shared variable sv : t_shreg;
begin
  process(strobe)
  begin
    if strobe'event and strobe = '1' then
      sv.shift_in('1');
      data <= sv.parallel_out;
    end if;
  end process;
end architecture rtl;
