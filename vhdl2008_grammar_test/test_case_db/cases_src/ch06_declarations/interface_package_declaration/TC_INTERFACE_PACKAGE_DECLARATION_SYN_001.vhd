-- =============================================================
-- Case ID: TC_INTERFACE_PACKAGE_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_PACKAGE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_package_declaration ::=
--   package identifier is new uninstantiated_package_name
--   interface_package_generic_map_aspect
-- Case Type: Positive
-- Test Focus: Basic interface_package_declaration — entity generic
--   clause instantiates a generic package with explicit map.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

package pkg_adder is
  generic (W : positive := 8);
  function f_add(a, b : bit_vector) return bit_vector;
end package pkg_adder;

package body pkg_adder is
  function f_add(a, b : bit_vector) return bit_vector is
    variable result : bit_vector(a'length-1 downto 0);
    variable carry  : bit := '0';
  begin
    for i in 0 to a'length-1 loop
      result(i) := a(i) xor b(i) xor carry;
      carry := (a(i) and b(i)) or (a(i) and carry) or (b(i) and carry);
    end loop;
    return result;
  end function f_add;
end package body pkg_adder;

entity tc_ipd_syn_001 is
  generic (
    package my_adder is new work.pkg_adder generic map (W => 16)
  );
  port (
    op_a, op_b : in  bit_vector(15 downto 0);
    op_sum     : out bit_vector(15 downto 0)
  );
end entity tc_ipd_syn_001;

architecture bh of tc_ipd_syn_001 is
begin
  op_sum <= my_adder.f_add(op_a, op_b);
end architecture bh;
