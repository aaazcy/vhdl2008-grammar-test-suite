-- =============================================================
-- Case ID: TC_ENTITY_NAME_LIST_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_NAME_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_name_list ::= entity_designator { , entity_designator } | others | all
-- Case Type: Positive
-- Test Focus: entity_name_list with entity_designators carrying signatures and mixed entity_classes -- exercises a comma-separated entity_name_list where some entity_designators include signatures for overloaded functions and the entity_class varies between "function" and "signal", testing entity_designator-with-signature as a component of entity_name_list across different entity classes in separate attribute specifications
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity enl_sig_mixed is
  port(
    x, y : in  bit_vector(7 downto 0);
    p    : out bit_vector(15 downto 0)
  );
  attribute syn_dsp : string;
  attribute syn_dsp of x, y, p : signal is "mult_acc";
end entity;

architecture rtl of enl_sig_mixed is
  -- Overloaded function #1: unsigned multiply 8x8->16
  function f_mult(a, b : bit_vector(7 downto 0)) return bit_vector is
    variable v : bit_vector(15 downto 0) := (others => '0');
    variable a_ext : bit_vector(15 downto 0) := (others => '0');
  begin
    a_ext(7 downto 0) := a;
    for i in 0 to 7 loop
      if b(i) = '1' then v := v xor a_ext; end if;
      a_ext := a_ext(14 downto 0) & '0';
    end loop;
    return v;
  end function;

  -- Overloaded function #2: signed multiply 8x8->16
  function f_mult(a, b : integer) return integer is
  begin
    return a * b;
  end function;

  -- entity_name_list with signatures for disambiguation
  attribute syn_dsp of
    f_mult [bit_vector, bit_vector return bit_vector]
    : function is "mult_acc";

  signal x_r, y_r : bit_vector(7 downto 0) := X"00";
begin
  x_r <= x; y_r <= y;
  p <= f_mult(x_r, y_r);
end architecture rtl;
