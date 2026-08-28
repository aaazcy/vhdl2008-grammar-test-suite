-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_PART_SEM_002
-- Related Rule ID: SEM_PROTECTE_002
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declarative_part ::= { protected_type_declarative_item }
-- Case Type: Positive
-- Test Focus: SEMANTIC -- protected declarative part with multiple
--            subprogram declarations forming a complete interface for
--            a fixed-point accumulator. Both procedure and function
--            methods are declared, establishing the full method
--            signature set in the declarative part.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pt_dp_sem_accumulator is
  port (
    clk  : in  bit;
    dout : out integer
  );
end entity pt_dp_sem_accumulator;
architecture rtl of pt_dp_sem_accumulator is
  type t_accum is protected
    procedure add(x : integer);
    procedure reset;
    impure function total return integer;
  end protected;
  type t_accum is protected body
    variable v_sum : integer := 0;
    procedure add(x : integer) is begin v_sum := v_sum + x; end procedure;
    procedure reset is begin v_sum := 0; end procedure;
    impure function total return integer is begin return v_sum; end function;
  end protected body;
  shared variable sv : t_accum;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then sv.add(5); dout <= sv.total; end if;
  end process;
end architecture rtl;
