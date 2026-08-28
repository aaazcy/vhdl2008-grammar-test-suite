-- =============================================================
-- Case ID: TC_CHOICES_SNN_003
-- Rule Type: Syntax
-- BNF Production: choices
-- IEEE Section: 9.3.3.1
-- BNF Text: choices ::= choice { | choice }
-- Test Focus: duplicate choice value appearing in two pipe-separated branches of the same case statement
-- Case Type: Negative
-- Expected Result: Triggers semantic error (duplicate choice in case statement)
-- Dependencies: None
-- =============================================================
entity tc_choices_snn_003 is
  port (
    sel    : in  integer range 0 to 7;
    result : out integer
  );
end entity tc_choices_snn_003;

architecture error of tc_choices_snn_003 is
begin
  process(sel)
  begin
    case sel is
      when 0 | 1 | 2 =>  -- first occurrence of 2
        result <= 1;
      when 2 | 3 | 4 =>  -- ERROR: duplicate choice '2' already covered above
        result <= 2;
      when others =>
        result <= 0;
    end case;
  end process;
end architecture error;
