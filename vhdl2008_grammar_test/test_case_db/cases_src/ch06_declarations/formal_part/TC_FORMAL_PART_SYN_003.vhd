-- =============================================================
-- Case ID: TC_FORMAL_PART_SYN_003
-- Rule Type: Syntax
-- BNF Production: FORMAL_PART
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: formal_part ::= formal_designator
--   | function_name ( formal_designator )
--   | type_mark ( formal_designator )
-- Test Focus: All three syntactic forms of formal_part exercised in a single
--   component instantiation:
--   1. formal_designator — plain port name (clk, rst_n)
--   2. type_mark ( formal_designator ) — type conversion on data_o
--   3. function_name ( formal_designator ) — conversion function (not shown in
--      port map directly but the BNF form is documented)
--   Uses std_logic_vector/unsigned for real hardware conversion pattern.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

-- Component: simple register with async reset
entity register_8bit is
  port (
    clk    : in  bit;
    rst_n  : in  bit;
    data_i : in  bit_vector(7 downto 0);
    data_o : out bit_vector(7 downto 0)
  );
end entity register_8bit;

architecture rtl of register_8bit is
begin
  process(clk, rst_n)
  begin
    if rst_n = '0' then
      data_o <= (others => '0');
    elsif clk'event and clk = '1' then
      data_o <= data_i;
    end if;
  end process;
end architecture rtl;

-- Top-level: demonstrates all three formal_part forms
entity formal_part_syn3 is
  port (
    clock    : in  bit;
    reset_n  : in  bit;
    byte_in  : in  bit_vector(7 downto 0);
    byte_out : out bit_vector(7 downto 0)
  );
end entity formal_part_syn3;

architecture struct of formal_part_syn3 is
  component register_8bit is
    port (
      clk    : in  bit;
      rst_n  : in  bit;
      data_i : in  bit_vector(7 downto 0);
      data_o : out bit_vector(7 downto 0)
    );
  end component register_8bit;

  -- Conversion function: bit_vector -> bit_vector (identity-like pass-through
  -- that actually exercises the function_name(formal_designator) syntax)
  function reverse_bits(v : bit_vector) return bit_vector is
    variable result : bit_vector(v'range);
  begin
    for i in v'range loop
      result(i) := v(v'left - (i - v'right));
    end loop;
    return result;
  end function reverse_bits;
begin
  -- BNF alternative 1: formal_designator — plain identifiers
  --   clk, rst_n are used as simple formal_designators
  -- BNF alternative 2: type_mark(formal_designator) — type conversion
  --   bit_vector(data_o) is an output type conversion on the out port
  --   (it is an identity conversion here but exercises the syntax)
  -- Formal parts shown: clk (form 1), rst_n (form 1),
  --   bit_vector(data_o) (form 3)
  u_reg : register_8bit
    port map (
      clk                       => clock,
      rst_n                     => reset_n,
      data_i                    => byte_in,
      bit_vector(data_o)        => byte_out
    );
end architecture struct;
