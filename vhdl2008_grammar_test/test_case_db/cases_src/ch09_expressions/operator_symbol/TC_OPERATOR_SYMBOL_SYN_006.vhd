-- =============================================================
-- Case ID: TC_OPERATOR_SYMBOL_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_OPERATOR_SYMBOL
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: operator_symbol ::= string_literal
-- Case Type: Positive
-- Test Focus: Shift operator overloading: string_literal "sll"/"srl"/"sla"/"sra"/"rol"/"ror" used as function names, implementing six shift operations on bit_vector
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity op_sym_shift is
  port (
    shift_sel : in  integer range 0 to 5;
    data_in   : in  bit_vector(7 downto 0);
    n         : in  integer range 0 to 7;
    data_out  : out bit_vector(7 downto 0)
  );
end entity op_sym_shift;

architecture shift_ops of op_sym_shift is
  type t_shifter is array(0 to 5) of bit_vector(7 downto 0);

  function "sll"(v : bit_vector; cnt : integer) return bit_vector is
    variable r : bit_vector(v'range) := (others => '0');
  begin
    for i in v'low to v'high - cnt loop r(i) := v(i + cnt); end loop;
    return r;
  end function "sll";

  function "srl"(v : bit_vector; cnt : integer) return bit_vector is
    variable r : bit_vector(v'range) := (others => '0');
  begin
    for i in v'low + cnt to v'high loop r(i) := v(i - cnt); end loop;
    return r;
  end function "srl";

  function "rol"(v : bit_vector; cnt : integer) return bit_vector is
    variable r : bit_vector(v'range);
  begin
    for i in v'range loop r(i) := v((v'high - cnt + i - v'low) mod v'length + v'low); end loop;
    return r;
  end function "rol";

  function "ror"(v : bit_vector; cnt : integer) return bit_vector is
    variable r : bit_vector(v'range);
  begin
    for i in v'range loop r(i) := v((i + cnt - v'low) mod v'length + v'low); end loop;
    return r;
  end function "ror";

  function "sla"(v : bit_vector; cnt : integer) return bit_vector is
    variable r : bit_vector(v'range) := (others => '0');
  begin
    for i in v'low to v'high - cnt loop r(i) := v(i + cnt); end loop;
    return r;
  end function "sla";

  function "sra"(v : bit_vector; cnt : integer) return bit_vector is
    variable r : bit_vector(v'range) := (others => v(v'high));
  begin
    for i in v'low + cnt to v'high loop r(i) := v(i - cnt); end loop;
    return r;
  end function "sra";
begin
  with shift_sel select
    data_out <= "sll"(data_in, n) when 0,
                "srl"(data_in, n) when 1,
                "sla"(data_in, n) when 2,
                "sra"(data_in, n) when 3,
                "rol"(data_in, n) when 4,
                "ror"(data_in, n) when 5;
end architecture shift_ops;
