-- =============================================================
-- Case ID: TC_IF_STATEMENT_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_IF_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: if_statement ::= [ if_label : ] if condition then sequence_of_statements { elsif condition then sequence_of_statements } [ else sequence_of_statements ] end if [ if_label ] ;
-- Case Type: Positive
-- Test Focus: SEM: If-statement inside a function must assign the return value on all possible execution paths — function `clamp` uses if-then-else to bound an integer to [lo, hi] range; the then branch returns hi when val>hi, the elsif branch returns lo when val<lo, and the else branch returns val for the middle case; semantically this guarantees the function always produces a defined return, verifying that the if_statement's three-branch structure covers the entire input space without a missing-return path
-- Expected Result: Compiles and simulates successfully — return value always assigned regardless of input
-- Dependencies: Simulator with full VHDL 2008 support
-- =============================================================
entity if_func_retpath_ent is port(
  raw_val : in  integer range 0 to 255;
  lo, hi  : in  integer range 0 to 255;
  clamped : out integer range 0 to 255
); end entity;
architecture bh of if_func_retpath_ent is
  function clamp(val, lo, hi : integer) return integer is
  begin
    if val > hi then
      return hi;
    elsif val < lo then
      return lo;
    else
      return val;
    end if;
  end function clamp;
begin
  process(raw_val, lo, hi) begin
    clamped <= clamp(raw_val, lo, hi);
  end process;
end architecture bh;
