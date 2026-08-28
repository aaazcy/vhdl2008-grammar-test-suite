-- =============================================================
-- Case ID: TC_FUNCTION_CALL_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_FUNCTION_CALL
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: function_call ::= function_name [ ( actual_parameter_part ) ]
-- Case Type: Positive
-- Test Focus: user-defined function call: f_encode accepts bit_vector and returns bit_vector, verifying the call of a user-defined function and the assignment of its result
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_fc_user is
  port (
    din  : in  bit_vector(3 downto 0);
    dout : out bit_vector(7 downto 0)
  );
end entity ent_fc_user;

architecture user_func of ent_fc_user is
  function f_encode(data : bit_vector) return bit_vector is
    variable v : bit_vector(7 downto 0) := (others => '0');
  begin
    v(data'length - 1 downto 0) := data;
    return v;
  end function;
begin
  dout <= f_encode(din);
end architecture user_func;
