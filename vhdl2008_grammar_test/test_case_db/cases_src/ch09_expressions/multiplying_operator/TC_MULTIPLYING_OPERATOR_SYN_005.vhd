-- =============================================================
-- Case ID: TC_MULTIPLYING_OPERATOR_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_MULTIPLYING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: multiplying_operator ::= * | / | mod | rem
-- Case Type: Positive
-- Test Focus: the rem operator used to judge integer parity — the result of rem 2 determines whether the input value is odd, controlling the toggle of a divider output, verifying the use of rem in a conditional expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_rem_parity is
  port (
    clk      : in  bit;
    toggle_o : out bit
  );
end entity ent_rem_parity;

architecture rtl of ent_rem_parity is
  signal counter : integer range 0 to 15 := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if (counter rem 2) = 0 then
        toggle_o <= '1';
      else
        toggle_o <= '0';
      end if;
      if counter < 15 then
        counter <= counter + 1;
      else
        counter <= 0;
      end if;
    end if;
  end process;
end architecture rtl;
