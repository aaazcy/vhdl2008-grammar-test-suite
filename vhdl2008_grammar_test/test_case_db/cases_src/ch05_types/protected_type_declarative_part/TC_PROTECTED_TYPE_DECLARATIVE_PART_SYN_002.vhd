-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_PART_SYN_002
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declarative_part ::=
--   { protected_type_declarative_item }
-- Test Focus: Single item — one procedure declaration in the
--   declarative part. The minimal non-empty case.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_decl_dp_single is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_decl_dp_single;

architecture rtl of pt_decl_dp_single is
  type t_single is protected
    procedure update(v : integer);
  end protected;
  type t_single is protected body
    variable v_data : integer := 0;
    procedure update(v : integer) is begin v_data := v; end procedure;
  end protected body;
  shared variable sv : t_single;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.update(7);
      val <= 7;
    end if;
  end process;
end architecture rtl;
