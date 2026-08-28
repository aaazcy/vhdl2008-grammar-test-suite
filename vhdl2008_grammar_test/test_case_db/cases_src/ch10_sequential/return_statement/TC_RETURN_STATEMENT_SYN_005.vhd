-- =============================================================
-- Case ID: TC_RETURN_STATEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_RETURN_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.13
-- Production: return_statement ::= [ label : ] return [ expression ] ;
-- Case Type: Positive
-- Test Focus: With label: `done_return: return result;` — verifying that a return statement may carry an optional label prefix
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity return_labeled_ent is
  port (
    dividend : in  integer range 1 to 255;
    divisor  : in  integer range 1 to 255;
    quotient : out integer range 0 to 255
  );
end entity return_labeled_ent;

architecture safe_div of return_labeled_ent is
  function div_with_check(a, b : integer) return integer is
  begin
    if b = 0 then
      zero_div: return 0;  -- labeled return
    end if;
    normal_div: return a / b;
  end function;
begin
  process(dividend, divisor) is
  begin
    quotient <= div_with_check(dividend, divisor);
  end process;
end architecture safe_div;
