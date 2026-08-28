-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DEFINITION_SYN_005
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_definition ::=
--   protected_type_declaration | protected_type_body
-- Test Focus: Protected type definition with attribute
--   specifications on both declaration and body sides.
--   Tests attributes applied to methods and body-side
--   variables within the same complete definition.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_def_with_attrs is
  port (
    clk : in  bit;
    out_val : out bit_vector(7 downto 0)
  );
end entity pt_def_with_attrs;

architecture rtl of pt_def_with_attrs is
  attribute pipeline : string;
  subtype t_byte is bit_vector(7 downto 0);
  type t_buffer is protected
    procedure push(d : bit_vector(7 downto 0));
    impure function pop return t_byte;
    attribute pipeline of push : procedure is "stage1";
  end protected;
  type t_buffer is protected body
    variable v_data : bit_vector(7 downto 0) := (others => '0');
    attribute keep : string;
    attribute keep of v_data : variable is "true";
    procedure push(d : bit_vector(7 downto 0)) is begin v_data := d; end procedure;
    impure function pop return t_byte is begin return v_data; end function;
  end protected body;
  shared variable sv : t_buffer;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.push("11110000");
      out_val <= sv.pop;
    end if;
  end process;
end architecture rtl;
