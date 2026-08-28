-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DEFINITION_SYN_004
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_definition ::=
--   protected_type_declaration | protected_type_body
-- Test Focus: Multiple shared variables of the same protected
--   type, demonstrating that the type definition supports
--   multiple instances. Tests the scalability of the
--   type definition with independent state per instance.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_def_multi_instance is
  port (
    clk   : in  bit;
    sum   : out integer
  );
end entity pt_def_multi_instance;

architecture rtl of pt_def_multi_instance is
  type t_adder is protected
    procedure add(x : integer);
    impure function total return integer;
  end protected;
  type t_adder is protected body
    variable v_sum : integer := 0;
    procedure add(x : integer) is begin v_sum := v_sum + x; end procedure;
    impure function total return integer is begin return v_sum; end function;
  end protected body;
  shared variable sv_a : t_adder;
  shared variable sv_b : t_adder;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv_a.add(3);
      sv_b.add(7);
      sum <= sv_a.total + sv_b.total;
    end if;
  end process;
end architecture rtl;
