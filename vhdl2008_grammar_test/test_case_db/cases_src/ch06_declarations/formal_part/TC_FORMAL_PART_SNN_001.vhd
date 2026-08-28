-- =============================================================
-- Case ID: TC_FORMAL_PART_SNN_001
-- Rule Type: Syntax (Negative)
-- BNF Production: FORMAL_PART
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: formal_part ::= formal_designator
--   | function_name ( formal_designator )
--   | type_mark ( formal_designator )
-- Test Focus: SNN — missing opening parenthesis in type_mark(formal_designator)
--   form. The BNF requires '(' immediately after the type_mark. Writing
--   "bit_vector data_i" without the '(' is syntactically invalid because
--   the parser expects '(' to begin the formal_designator argument.
-- Case Type: Negative
-- Expected Result: Triggers syntax error (missing '(' after type_mark)
-- Dependencies: None
-- =============================================================

entity latch_4bit is
  port (
    en     : in  bit;
    din    : in  bit_vector(3 downto 0);
    dout   : out bit_vector(3 downto 0)
  );
end entity latch_4bit;

architecture rtl of latch_4bit is
begin
  process(en, din)
  begin
    if en = '1' then
      dout <= din;
    end if;
  end process;
end architecture rtl;

entity formal_part_snn1 is
  port (
    gate    : in  bit;
    nib_in  : in  bit_vector(3 downto 0);
    nib_out : out bit_vector(3 downto 0)
  );
end entity formal_part_snn1;

architecture struct of formal_part_snn1 is
  component latch_4bit is
    port (
      en   : in  bit;
      din  : in  bit_vector(3 downto 0);
      dout : out bit_vector(3 downto 0)
    );
  end component latch_4bit;
begin
  -- ERROR: "bit_vector din" — missing '(' after type_mark.
  -- Correct syntax would be: bit_vector(din)
  u_latch : latch_4bit
    port map (
      en              => gate,
      bit_vector din  => nib_in,   -- ERROR: missing '(' after type_mark
      dout            => nib_out
    );
end architecture struct;
