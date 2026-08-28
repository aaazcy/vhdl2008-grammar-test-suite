-- =============================================================
-- Case ID: TC_CHOICES_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICES
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: choices ::= choice { | choice }
-- Case Type: Negative
-- Test Focus: SNN: double pipe symbol: choice ｜｜ choice, a choice is missing between two consecutive pipe operators, so the syntax is illegal
-- Expected Result: Triggers syntax error: double pipe "||" is not a valid choice separator
-- Dependencies: None
-- =============================================================
entity chs_snn_004 is
  port (
    sel : in  integer range 0 to 3;
    y   : out integer
  );
end entity chs_snn_004;

architecture double_pipe of chs_snn_004 is
begin
  process(sel)
  begin
    case sel is
      when 1 || 2 =>   -- ERROR: double pipe, no choice between them
        y <= 10;
      when others =>
        y <= 0;
    end case;
  end process;
end architecture double_pipe;
