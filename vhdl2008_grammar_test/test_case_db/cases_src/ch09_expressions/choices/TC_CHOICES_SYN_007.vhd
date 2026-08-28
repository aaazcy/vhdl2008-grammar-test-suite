-- =============================================================
-- Case ID: TC_CHOICES_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICES
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: choices ::= choice { | choice }
-- Case Type: Positive
-- Test Focus: pipe choices used in a matching case statement: the choices in a VHDL 2008 matching case contain pipes, verifying that pipe-separated choices work correctly under ?= matching semantics
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity chs_matching_case is
  port (
    data    : in  bit_vector(7 downto 0);
    matched : out bit
  );
end entity chs_matching_case;

architecture match_pipe of chs_matching_case is
begin
  process(data)
  begin
    case? data is
      when "00000000" | "00000001" | "00000010" =>  -- choices with pipe in matching case
        matched <= '1';
      when "11111110" | "11111101" | "11111011" =>   -- choices with pipe
        matched <= '1';
      when others =>
        matched <= '0';
    end case?;
  end process;
end architecture match_pipe;
