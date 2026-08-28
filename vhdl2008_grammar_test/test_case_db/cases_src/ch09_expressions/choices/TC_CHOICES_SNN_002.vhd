-- =============================================================
-- Case ID: TC_CHOICES_SNN_002
-- Rule Type: Syntax
-- BNF Production: choices
-- IEEE Section: 9.3.3.1
-- BNF Text: choices ::= choice { | choice }
-- Test Focus: malformed choices syntax - trailing pipe with no subsequent choice
-- Case Type: Negative
-- Expected Result: Triggers syntax error (trailing pipe without following choice)
-- Dependencies: None
-- =============================================================
entity tc_choices_snn_002 is
  port (
    sel    : in  integer range 0 to 7;
    result : out integer
  );
end entity tc_choices_snn_002;

architecture error of tc_choices_snn_002 is
begin
  process(sel)
  begin
    case sel is
      when 0 | 1 | =>  -- ERROR: trailing pipe '|' with no following choice
        result <= 42;
      when others =>
        result <= 0;
    end case;
  end process;
end architecture error;
