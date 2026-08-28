-- =============================================================
-- Case ID: TC_CHOICES_SYN_002
-- Rule Type: Syntax
-- BNF Production: choices
-- IEEE Section: 9.3.3.1
-- BNF Text: choices ::= choice { | choice }
-- Test Focus: multiple choices combining discrete_range and simple_expression with pipe in a single case
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_choices_syn_002 is
  port (
    epoch   : in  integer range 1900 to 2100;
    century : out integer range 19 to 21
  );
end entity tc_choices_syn_002;

architecture classify of tc_choices_syn_002 is
begin
  process(epoch)
  begin
    case epoch is
      when 1900 to 1998 | 1999 =>
        century <= 19;
      when 2000 to 2098 | 2099 =>
        century <= 20;
      when others =>
        century <= 21;
    end case;
  end process;
end architecture classify;
