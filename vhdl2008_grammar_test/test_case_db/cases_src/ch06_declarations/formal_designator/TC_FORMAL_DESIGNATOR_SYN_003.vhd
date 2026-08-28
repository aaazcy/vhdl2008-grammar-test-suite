-- =============================================================
-- Case ID: TC_FORMAL_DESIGNATOR_SYN_003
-- Rule Type: Syntax
-- BNF Production: FORMAL_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: formal_designator ::= generic_name | port_name | parameter_name
-- Test Focus: formal_designator as generic_name — generic map with formal=>actual
--   binding. Verifies that a generic name identifier can appear as the
--   formal_designator on the left side of a generic map association.
--   Also exercises port_name formal_designators in the same instantiation.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

-- Component: parameterised adder with configurable width
entity adder_param is
  generic (
    DATA_WIDTH : integer := 8
  );
  port (
    a     : in  bit_vector(DATA_WIDTH-1 downto 0);
    b     : in  bit_vector(DATA_WIDTH-1 downto 0);
    cin   : in  bit;
    sum   : out bit_vector(DATA_WIDTH-1 downto 0);
    cout  : out bit
  );
end entity adder_param;

architecture rtl of adder_param is
  signal s_carry : bit_vector(DATA_WIDTH downto 0);
begin
  s_carry(0) <= cin;
  gen_add : for i in 0 to DATA_WIDTH-1 generate
    sum(i)   <= a(i) xor b(i) xor s_carry(i);
    s_carry(i+1) <= (a(i) and b(i)) or (a(i) and s_carry(i)) or (b(i) and s_carry(i));
  end generate;
  cout <= s_carry(DATA_WIDTH);
end architecture rtl;

-- Top-level: instantiates with both generic and port maps
entity adder_top is
  port (
    op_a    : in  bit_vector(3 downto 0);
    op_b    : in  bit_vector(3 downto 0);
    carry_in : in  bit;
    result  : out bit_vector(3 downto 0);
    carry_out : out bit
  );
end entity adder_top;

architecture struct of adder_top is
  component adder_param is
    generic (
      DATA_WIDTH : integer := 8
    );
    port (
      a    : in  bit_vector(DATA_WIDTH-1 downto 0);
      b    : in  bit_vector(DATA_WIDTH-1 downto 0);
      cin  : in  bit;
      sum  : out bit_vector(DATA_WIDTH-1 downto 0);
      cout : out bit
    );
  end component adder_param;
begin
  -- DATA_WIDTH is a generic_name formal_designator
  -- a, b, cin, sum, cout are port_name formal_designators
  u_adder : adder_param
    generic map (
      DATA_WIDTH => 4
    )
    port map (
      a    => op_a,
      b    => op_b,
      cin  => carry_in,
      sum  => result,
      cout => carry_out
    );
end architecture struct;
