-- =============================================================
-- Case ID: TC_ALIAS_DESIGNATOR_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ALIAS_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.6.1
-- Production: alias_designator ::= identifier | character_literal
--              | operator_symbol
-- Case Type: Positive (Production-Specific)
-- Test Focus: alias_designator — exercises multiple operator_symbol
--             forms ("and", "or", "not") and character_literal ('1')
--             with progressive complexity in a logic unit context.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity alias_designator_syn3 is
  port (
    clk     : in  bit;
    a_vec   : in  bit_vector(3 downto 0);
    b_vec   : in  bit_vector(3 downto 0);
    and_out : out bit_vector(3 downto 0);
    or_out  : out bit_vector(3 downto 0);
    not_out : out bit_vector(3 downto 0)
  );
end entity alias_designator_syn3;

architecture arch of alias_designator_syn3 is

  -- alias_designator = operator_symbol: "and" is an operator symbol
  alias "and" is "and" [bit_vector, bit_vector return bit_vector];

  -- alias_designator = operator_symbol: "or" is an operator symbol
  alias "or" is "or" [bit_vector, bit_vector return bit_vector];

  -- alias_designator = operator_symbol: "not" is an operator symbol
  alias "not" is "not" [bit_vector return bit_vector];

  -- alias_designator = character_literal: '1' as a character literal
  type logic_level is (L0, L1, LZ, LX);
  signal drive_level : logic_level := L1;
  alias '1' is L1 [return logic_level];

  signal s_and_res : bit_vector(3 downto 0);
  signal s_or_res  : bit_vector(3 downto 0);
  signal s_not_res : bit_vector(3 downto 0);

begin

  process(clk)
  begin
    if clk'event and clk = '1' then
      -- Uses operator_symbol aliases for bitwise operations
      s_and_res <= a_vec and b_vec;
      s_or_res  <= a_vec or b_vec;
      s_not_res <= not a_vec;
    end if;
  end process;

  and_out <= s_and_res;
  or_out  <= s_or_res;
  not_out <= s_not_res;

end architecture arch;
