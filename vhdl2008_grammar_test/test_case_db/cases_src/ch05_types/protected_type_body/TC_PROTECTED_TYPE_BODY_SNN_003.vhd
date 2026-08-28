-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_SNN_003
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body ::=
--   protected body
--     protected_type_body_declarative_part
--   end protected body [ protected_type_simple_name ]
-- Test Focus: ERROR — optional trailing simple_name does not
--   match the type identifier. The BNF [ protected_type_simple_name ]
--   must match the type name used in the type definition.
-- Case Type: Negative
-- Expected Result: Triggers syntax/semantic error
-- =============================================================
entity pt_body_snn_name_mismatch is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_body_snn_name_mismatch;

architecture rtl of pt_body_snn_name_mismatch is
  type t_holder is protected
    procedure store(x : integer);
    impure function read return integer;
  end protected;
  type t_holder is protected body
    variable v : integer := 0;
    procedure store(x : integer) is begin v := x; end procedure;
    impure function read return integer is begin return v; end function;
  end protected body t_holderx;               -- ERROR: name 't_holderx' != 't_holder'
  shared variable sv : t_holder;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.store(77); val <= sv.read;
    end if;
  end process;
end architecture rtl;
