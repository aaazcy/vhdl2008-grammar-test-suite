-- =============================================================
-- Case ID: TC_FORMAL_PART_SNN_004
-- Rule Type: Syntax (Negative)
-- BNF Production: FORMAL_PART
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: formal_part ::= formal_designator
--   | function_name ( formal_designator )
--   | type_mark ( formal_designator )
-- Test Focus: SNN — missing closing parenthesis in type_mark(formal_designator)
--   form. The BNF requires ')' after the formal_designator. Writing
--   "bit_vector(data_i" without the closing ')' is syntactically invalid.
-- Case Type: Negative
-- Expected Result: Triggers syntax error (missing ')' after formal_designator)
-- Dependencies: None
-- =============================================================

entity buffer_2bit is
  port (
    a : in  bit_vector(1 downto 0);
    b : out bit_vector(1 downto 0)
  );
end entity buffer_2bit;

architecture rtl of buffer_2bit is
begin
  b <= a;
end architecture rtl;

entity formal_part_snn4 is
  port (
    pair_in  : in  bit_vector(1 downto 0);
    pair_out : out bit_vector(1 downto 0)
  );
end entity formal_part_snn4;

architecture struct of formal_part_snn4 is
  component buffer_2bit is
    port (
      a : in  bit_vector(1 downto 0);
      b : out bit_vector(1 downto 0)
    );
  end component buffer_2bit;
begin
  -- ERROR: "bit_vector(a" — missing closing ')' after formal_designator.
  -- Correct syntax would be: bit_vector(a)
  u_buf : buffer_2bit
    port map (
      bit_vector(a  => pair_in,   -- ERROR: missing ')' after formal_designator
      b             => pair_out
    );
end architecture struct;
