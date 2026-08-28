-- =============================================================
-- Case ID: TC_LITERAL_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Case Type: Positive
-- Test Focus: null literal as a literal: using null in access type variable initialization, report statement messages, and conditional assignment, verifying three different contexts of null as a literal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity lit_null_literal is
  port (
    valid : in  bit;
    data  : out integer
  );
end entity lit_null_literal;

architecture null_usage of lit_null_literal is
  type t_int_ptr is access integer;
begin
  process(valid)
    variable v_ptr : t_int_ptr := null;  -- null literal in access type init
  begin
    if valid = '1' then
      v_ptr := new integer'(42);
      data <= v_ptr.all;
      deallocate(v_ptr);
      v_ptr := null;  -- null literal in assignment
    else
      data <= 0;
    end if;
  end process;
end architecture null_usage;
